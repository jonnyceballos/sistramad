class AdminProceduresController < ApplicationController
  include EmailService
  before_action :set_procedure, only: [:show, :complete]

  def index
    @procedures = Procedure.where(state: 'in_progress').page(params[:page]).per(10)
  end

  def show

  end

  def show_initial_requirements
    @procedure = Procedure.find(params[:procedure])
  end

  def approve_initial_requirements
    @procedure = Procedure.find(params[:id])
    procedure_instance = get_procedure_intance(@procedure)

    if procedure_instance.approve_initial_requirements?
      flash[:success] = 'Los documentos han sido aprobados con éxito.'
      render 'show'
    else
      flash[:error] = 'Imposible realizar ésta acción, error en el estado del paso.'
      render 'show_initial_requirements'
    end
  end

  def show_document
    @procedure = Procedure.find(params[:id])
    @document = @procedure.documents.find_by(code: params[:document_code])
    @step = @procedure.steps.find_by(name: params[:step])
  end

  def approve_document
    @document = Document.find(params[:id])
    @procedure = Procedure.find(procedure)
  end

  def approve_step
    @procedure = Procedure.find(params[:id])
    step = Step.find(params[:step])
    if step.in_progress?
      step.approve!
      send_email(@procedure.user, 'step_approved')
      flash[:success] = 'Paso aprobado con éxito!.'
    else
      flash[:error] = 'Imposible realizar ésta acción.'
    end
    redirect_to  admin_procedure_path(@procedure)
  end

  def complete
    steps_approved = true
    @procedure.steps.each do |step|
      unless step.approved?
        steps_approved = false
      end
    end

    if @procedure.in_progress? and steps_approved
      @procedure.approve!
      flash[:success] = 'Solicitud aprobada con exito!'
      redirect_to  admin_procedure_path(@procedure)
    else
      flash[:error] = 'Imposible completar la solicitud, todos los pasos deben estar aprobados.'
      redirect_to  admin_procedure_path(@procedure)
    end
  end

  def generate_approval_document
    @procedure = Procedure.find(params[:procedure])
    @user = User.find(@procedure.user.id)

    if generate_pdf?(@procedure, @user)
      procedure = get_procedure_intance(@procedure)
      procedure.approve_generate_approval_document_step()
      flash[:success] = 'Constacia generada con éxito.'       
    else
      flash[:error] = 'Error al generar constacia de aprobación.'
    end
    redirect_to  admin_procedure_path(@procedure)
  end

  private

    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def get_procedure_intance(procedure)
      procedure_instance = get_procedure_from_factory(procedure.code)
      procedure_instance.procedure = procedure
      return procedure_instance
    end

    def get_procedure_from_factory(procedure_code)
      factory = ProcedureFactory.new
      factory.build(procedure_code)
    end

    def generate_pdf?(procedure, user)
      document = Document.new(name: 'Constancia de Aprobación', code: 'CDAP')
      document.procedure = procedure
      document.user = user    
    
      pdf = render_to_string pdf: "oficio", template: 'admin_procedures/oficio', encoding: "UTF-8"

      tempfile = Tempfile.new(["#{'oficio_temp'}", ".pdf"], Rails.root.join('tmp'))
      tempfile.binmode
      tempfile.write pdf
      tempfile.close

      document.attachment = tempfile
      document.save     
    end

end

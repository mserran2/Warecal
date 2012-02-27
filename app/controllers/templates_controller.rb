class TemplatesController < ApplicationController
  # GET /templates
  # GET /templates.json
  
  def index
    @templates = Template.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @templates }
    end
  end

  # GET /templates/1
  # GET /templates/1.json
  def show
    @template = Template.find(params[:id])
    puts @template[:start]
    @template[:start] = Time.strptime("%04d" % @template[:start], "%H%M").strftime("at %I:%M%p")
    puts "******************************************"
    puts @template[:start]
    @template[:end] = Time.strptime("%04d" % @template[:end], "%H%M").strftime("%I:%M%P")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @template }
    end
  end

  # GET /templates/new
  # GET /templates/new.json
  def new
    @template = Template.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @template }
    end
  end
  
  def batch_new
    @template = Template.new

    respond_to do |format|
      format.html  {render 'batchnew.html.erb'}
      format.json  {render json: @template }
    end
  end

  # GET /templates/1/edit
  def edit
    @template = Template.find(params[:id])
    @template[:start] = Time.strptime("%04d" % @template[:start], "%H%M").strftime("%I:%M%P")
    @template[:end] = Time.strptime("%04d" % @template[:end], "%H%M").strftime("%I:%M%P")
  end

  # POST /templates
  # POST /templates.json
  def create
    if params[:days]
      puts params
      flash[:warning] = ""
      params[:days].each do |key, value|
        if value == "1"
          s = Integer(Time.parse(params[:template][:start]).strftime("%k%M"))
          e = Integer(Time.parse(params[:template][:end]).strftime("%k%M"))
          
          if Template.where(:day => key, :start => s..e).empty? and Template.where(:day => key, :end => s..e).empty?
            @template = Template.new(:day => key, :start => s, :end => e)
            @template.save
          else
            flash[:warning] += "Failed to created shift on #{key} because it conflicts with another shift template. \n"
          end
        end
  
          flash[:notice] = "All shifts were created successfuly."
      end
      
  
      respond_to do |format|
          format.html { redirect_to templates_path }
          format.json { render json: @template, status: :created, location: templates_path }
      end
    else
      @template = Template.new(params[:template])
      respond_to do |format|
          if @template.save
            format.html { redirect_to @template, notice: 'Template was successfully created.' }
            format.json { render json: @template, status: :created, location: templates_path }
          else
            format.html { render action: "new" }
            format.json { render json: @template.errors, status: :unprocessable_entity }
          end
      end
    end
  end

  # PUT /templates/1
  # PUT /templates/1.json
  def update
    @template = Template.find(params[:id])

    respond_to do |format|
      if @template.update_attributes(params[:template])
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.json
  def destroy
    @template = Template.find(params[:id])
    @template.destroy

    respond_to do |format|
      format.html { redirect_to templates_url }
      format.json { head :ok }
    end
  end
end

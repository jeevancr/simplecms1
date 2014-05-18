class SubjectsController < ApplicationController
  
  layout "admin" 
    
  before_action :confirm_logged_in
    
  def index
      
      @subjects = Subject.sorted
      
  end

  def show
      
      @subject = Subject.find(params[:id])
      
  end

  def new
      
      @subject = Subject.new({:name => 'Default'})
      @subject_count = Subject.count + 1

  end
    
  def create
#      
#      instantiate a new object using form parameters
      @subject = Subject.new(subject_params)
#      save the object
      if @subject.save
#      if save succeeds, redirect to the index action
          flash[:notice] = "Subject created Successfully."
          redirect_to(:action => 'index')
      else
#      if save fails, redisplay the form so that the user can fic the problems
          @subject_count = Subject.count + 1
          render('new')
      end
  end

  def edit
      
      @subject = Subject.find(params[:id])
      @subject_count = Subject.count
  end
    
  def update
#      
#       Find an existing object using form parameters
      @subject = Subject.find(params[:id])
#       update the object
      if @subject.update_attributes(subject_params)
#       if update succeeds, redirect to the index action
        flash[:notice] = "Subject, '#{@subject.id}' updated Successfully."
        redirect_to(:action => 'show', :id => @subject.id)
      else
#       if update fails, redisplay the form so that the user can fic the problems
        @subject_count = Subject.count
        render('edit')
     end
  end

  def delete
      
      @subject = Subject.find(params[:id])
      
  end
    
  def destroy 
      
      subject = Subject.find(params[:id]).destroy
      flash[:notice] = "Subject, '#{subject.name}' destroyed Successfully."
      redirect_to(:action => 'index')
  end
    
    
    
    
private 
    
#    Same as using "params[:subject]", except that it:
#    -raises an error if :subject is not present
#    -allows listed attributes to be mass-assigned
    def subject_params
        params.require(:subject).permit(:name, :position, :visible)
    end
end

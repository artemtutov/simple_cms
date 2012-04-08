class SubjectsController < ApplicationController

	layout 'admin'

	before_filter :confirm_logged_in

	def index
		list
		render('list')	
	end
	
	def list
		@subjects = Subject.order("subjects.position ASC")	
	end	
	
	def show
		@subject = Subject.find(params[:id])
	end

	def new
		@subject = Subject.new
		@subject_count = Subject.count + 1
	end

	def create
		@subject = Subject.new(params[:subject])
		if @subject.save
			flash[:notice] = "Subject created successfully"
			redirect_to(:action => 'list')
		else
			@subject_count = Subject.count + 1
			render('new')
		end
		
	end

	def edit
		@subject = Subject.find(params[:id])
		@subject_count = Subject.count	
	end
	def update
		@subject = Subject.find(params[:id])
		if @subject.update_attributes(params[:subject])
			flash[:notice] = "Subject updated successfully"
			redirect_to(:action => 'show', :id => @subject.id)
		else
			@subject_count = Subject.count
			render('edit')
		end
		
	end			
	
	def delete
		@subject = Subject.find(params[:id])
	end

	def destroy
		@subject = Subject.find(params[:id])
		@subject.destroy		
		flash[:notice] = "Subject destroyed"
		redirect_to(:action => 'list')
	end

end

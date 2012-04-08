class PagesController < ApplicationController

	layout 'admin'
	
	before_filter :confirm_logged_in
	
	def index
		list
		render('list')	
	end
	
	def list
		@pages = Page.order("Pages.position ASC")	
	end	
	
	def show
		@page = Page.find(params[:id])
	end

	def new
		@page = Page.new
		@page_count = Page.count + 1
	end

	def create
		@page = Page.new(params[:page])
		if @page.save
			flash[:notice] = "Page created successfully"
			redirect_to(:action => 'list')
		else
			@page_count = Page.count + 1
			render('new')
		end
		
	end

	def edit
		@page = Page.find(params[:id])
		@page_count = Page.count
	end
	def update
		@page = Page.find(params[:id])
		if @page.update_attributes(params[:page])
			flash[:notice] = "Page updated successfully"
			redirect_to(:action => 'show', :id => @page.id)
		else
			@page_count = Page.count
			render('edit')
		end
		
	end			
	
	def delete
		@page = Page.find(params[:id])
	end

	def destroy
		@page = Page.find(params[:id])
		@page.destroy		
		flash[:notice] = "Page destroyed"
		redirect_to(:action => 'list')
	end

end

require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MarkersController do

  # This should return the minimal set of attributes required to create a valid
  # Marker. As you add validations to Marker, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all markers as @markers" do
      marker = Marker.create! valid_attributes
      get :index
      assigns(:markers).should eq([marker])
    end
  end

  describe "GET show" do
    it "assigns the requested marker as @marker" do
      marker = Marker.create! valid_attributes
      get :show, :id => marker.id
      assigns(:marker).should eq(marker)
    end
  end

  describe "GET new" do
    it "assigns a new marker as @marker" do
      get :new
      assigns(:marker).should be_a_new(Marker)
    end
  end

  describe "GET edit" do
    it "assigns the requested marker as @marker" do
      marker = Marker.create! valid_attributes
      get :edit, :id => marker.id
      assigns(:marker).should eq(marker)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Marker" do
        expect {
          post :create, :marker => valid_attributes
        }.to change(Marker, :count).by(1)
      end

      it "assigns a newly created marker as @marker" do
        post :create, :marker => valid_attributes
        assigns(:marker).should be_a(Marker)
        assigns(:marker).should be_persisted
      end

      it "redirects to the created marker" do
        post :create, :marker => valid_attributes
        response.should redirect_to(Marker.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved marker as @marker" do
        # Trigger the behavior that occurs when invalid params are submitted
        Marker.any_instance.stub(:save).and_return(false)
        post :create, :marker => {}
        assigns(:marker).should be_a_new(Marker)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Marker.any_instance.stub(:save).and_return(false)
        post :create, :marker => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested marker" do
        marker = Marker.create! valid_attributes
        # Assuming there are no other markers in the database, this
        # specifies that the Marker created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Marker.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => marker.id, :marker => {'these' => 'params'}
      end

      it "assigns the requested marker as @marker" do
        marker = Marker.create! valid_attributes
        put :update, :id => marker.id, :marker => valid_attributes
        assigns(:marker).should eq(marker)
      end

      it "redirects to the marker" do
        marker = Marker.create! valid_attributes
        put :update, :id => marker.id, :marker => valid_attributes
        response.should redirect_to(marker)
      end
    end

    describe "with invalid params" do
      it "assigns the marker as @marker" do
        marker = Marker.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Marker.any_instance.stub(:save).and_return(false)
        put :update, :id => marker.id, :marker => {}
        assigns(:marker).should eq(marker)
      end

      it "re-renders the 'edit' template" do
        marker = Marker.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Marker.any_instance.stub(:save).and_return(false)
        put :update, :id => marker.id, :marker => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested marker" do
      marker = Marker.create! valid_attributes
      expect {
        delete :destroy, :id => marker.id
      }.to change(Marker, :count).by(-1)
    end

    it "redirects to the markers list" do
      marker = Marker.create! valid_attributes
      delete :destroy, :id => marker.id
      response.should redirect_to(markers_url)
    end
  end

end

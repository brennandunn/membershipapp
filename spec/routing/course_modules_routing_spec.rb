require "spec_helper"

describe CourseModulesController do
  describe "routing" do

    it "routes to #index" do
      get("/course_modules").should route_to("course_modules#index")
    end

    it "routes to #new" do
      get("/course_modules/new").should route_to("course_modules#new")
    end

    it "routes to #show" do
      get("/course_modules/1").should route_to("course_modules#show", :id => "1")
    end

    it "routes to #edit" do
      get("/course_modules/1/edit").should route_to("course_modules#edit", :id => "1")
    end

    it "routes to #create" do
      post("/course_modules").should route_to("course_modules#create")
    end

    it "routes to #update" do
      put("/course_modules/1").should route_to("course_modules#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/course_modules/1").should route_to("course_modules#destroy", :id => "1")
    end

  end
end

class CompaniesController < ApplicationController
  def index
    # @companies = Company.all
    @companies = [
      {name: "Airbnb", url: "www.lewagon.com", employees: 5000, logo: "//logo.clearbit.com/airbnb.com", category: "product"},
      {name: "Spotify", url: "www.lewagon.com", employees: 300, logo: "//logo.clearbit.com/spotify.com", category: "agency"},
      {name: "Deliveroo", url: "www.lewagon.com", employees: 20, logo: "//logo.clearbit.com/deliveroo.com", category: "product"}
    ]
    @company = Company.new
  end

  def create
    @company = Company.create(product_params)
    city = City.find_by(city_params) || City.create(city_params)
    Location.create(city: city, company: @company)
  end

  private

  def product_params
    params.require(:company).permit(:name, :employees, :url, :category_id)
  end

  def city_params
    attributes = params.require(:city).permit(:name, :country)
    attributes.fetch(:name).downcase!
    attributes
  end
end

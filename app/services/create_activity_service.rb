class CreateActivityService
  def initialize(params)
    @params = params
  end

  def call
    Activity.create(@params)
  end
end

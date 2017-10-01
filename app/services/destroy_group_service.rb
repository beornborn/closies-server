class DestroyGroupService
  def initialize(group)
    @group = group
  end

  def call
    @group.destroy
  end
end

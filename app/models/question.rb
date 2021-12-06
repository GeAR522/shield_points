class Question
  attr_reader :id, :point_id, :review_subtotal, :testing_subtotal, :housekeeping_subtotal, :productivity_subtotal, :meta_subtotal, :created_at

  def initialize(attributes={})
    set_attributes(attributes)
  end
  
  def set_attributes(attributes)
    @id = attributes['id']
    @point_id = attributes['point_id']
    @review_subtotal = attributes['review_subtotal']
    @testing_subtotal = attributes['testing_subtotal']
    @housekeeping_subtotal = attributes['housekeeping_subtotal']
    @productivity_subtotal = attributes['productivity_subtotal']
    @meta_subtotal = attributes['meta_subtotal']
    @created_at ||= attributes['created_at']
  end
  
  def adding_subtotal
    subtotal += 1
  end
  
end

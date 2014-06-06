class Tree
  attr_accessor :name, :parent, :left, :right, :root

  def initialize(name, parent=nil)
    @name = name
    @parent = parent
    if @parent && @parent.left.nil?
      @parent.left = self
    elsif @parent && @parent.right.nil?
      @parent.right = self
    elsif @parent && @parent.left && @parent.right
      raise "The parent you specified already has two children. Please try again with a different parent."
      @parent = nil
    end
  end

  def pre
    puts @name
    @left.pre if @left
    @right.pre if @right
  end

  def in
    @left.in if @left
    puts @name
    @right.in if @right
  end

  def post
    @left.post if @left
    @right.post if @right
    puts @name
  end
end

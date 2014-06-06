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

  def search(root, type)
    @root = 0
    if type == "pre"
      self.pre_order(root, 0)
    elsif type == "in"
      self.in_order(root, 0)
    elsif type == "post"
      self.post_order(root, 0)
    else
      raise "Please use the root object as the first paramater and 'pre', 'in', or 'post' as the second."
    end
  end

  def pre_order(root, branch)
    if branch < 2
      @head = self
      puts @head.name
      if @head.left
        @head = @head.left
        @head.pre_order(root, branch)
      elsif @head.right
        @head = @head.right
        @head.pre_order(root, branch)
      else
        if @head.parent.right == self
          @head = root
          branch += 1
          @head = @head.right
          @head.pre_order(root, branch)
        else
          @head = @head.parent.right
          @head.pre_order(root, branch)
        end
      end
    end
  end

  def in_order(root, branch)
    if branch < 2
      @head = self
      if @head.left
        @head = @head.left
        @head.in_order(root, branch)
      elsif @head.right
        @head = @head.right
        @head.in_order(root, branch)
      else
        if @head.parent.left == self
          puts @head.name
          @head = @head.parent
          puts @head.name
          @head = @head.right
          @head.in_order(root, branch)
        else
          puts @head.name
          @head = root
          puts @head.name
          branch += 1
          @head = @head.right
          puts @head.name
          @head.in_order(root, branch)
        end
      end
    end
  end

  def post_order(root, branch, depth=0)
    if branch < 2
      @head = self
      if @head.left
        @head = @head.left
        depth += 1
        @head.post_order(root, branch, depth)
      elsif @head.right
        @head = @head.right
        @head.post_order(root, branch, depth)
      else
        if @head.parent.right == self
          puts @head.name
          while depth > 1
            depth -= 1
            @head = @head.parent
            puts @head.name
          end
          @head = root
          branch += 1
          @head = @head.right
          @head.post_order(root, branch, depth)
        else
          puts @head.name
          @head = @head.parent.right
          @head.post_order(root, branch, depth)
        end
      end
    elsif branch >= 2
      puts root.name
    end
  end
end


@tim = Tree.new("Tim")
@jony = Tree.new("Jony", @tim)
@phil = Tree.new("Phil", @tim)
@craig = Tree.new("Craig", @phil)
@eddie = Tree.new("Eddie", @phil)
@dan = Tree.new("Dan", @jony)
@katie = Tree.new("Katie", @jony)
@peter = Tree.new("Peter", @katie)
@andrea = Tree.new("Andrea", @katie)

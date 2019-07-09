class Question
  attr_reader :answer
  def initialize
    @range=20
    @answer=0;
  end

  def generate_question
    a=rand(19)+1;
    b=rand(19)+1;
    @answer=a+b;
    "What does #{a} plus #{b} equal?"
  end

end
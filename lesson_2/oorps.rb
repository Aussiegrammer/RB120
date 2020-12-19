class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  def initialize(value)
    case value
    when 'rock' then  @value = Rock.new
    when 'paper' then @value = Paper.new
    when 'scissors' then @value = Scissors.new
    when 'lizard' then @value = Lizard.new
    when 'spock' then @value = Spock.new
    end
  end

  def value
    @value.to_s
  end

  def >(other_move)
    true if @value.beats?(other_move)
  end
end

class Rock
  def to_s
    'rock'
  end

  def beats?(move)
    true if move.value == 'scissors' || move.value == 'lizard'
  end
end

class Paper
  def to_s
    'paper'
  end

  def beats?(move)
    true if move.value == 'rock' || move.value == 'spock'
  end
end

class Scissors
  def to_s
    'scissors'
  end

  def beats?(move)
    true if move.value == 'paper' || move.value == 'lizard'
  end
end

class Lizard
  def to_s
    'lizard'
  end

  def beats?(move)
    true if move.value == 'paper' || move.value == 'spock'
  end
end

class Spock
  def to_s
    'spock'
  end

  def beats?(move)
    true if move.value == 'scissors' || move.value == 'rock'
  end
end

class Player
  attr_accessor :score
  attr_reader :name, :move, :total_moves

  def initialize
    @total_moves = []
    @score = 0
    set_name
  end

  private

  attr_writer :name, :move
end

class Human < Player
  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice.downcase)
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice.downcase)
    @total_moves << move.value
  end

  private

  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break if n.count("a-zA-Z") > 0
      puts "Sorry, must enter a value."
    end
    self.name = n
  end
end

class Computer < Player
  attr_reader :personality, :move_set

  def choose
    self.move = 'test'
    case personality
    when :repeater then self.move = Move.new(move_set)
    when :weighted then self.move = Move.new(move_set.sample)
    when :surprise then self.move = Move.new(move_set.sample)
    when :classic  then self.move = Move.new(Move::VALUES.sample)
    end
    @total_moves << move.value
  end

  private

  def initialize
    super
    set_personality
  end

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Number 5', 'Sonny'].sample
  end

  def set_personality
    case name
    when 'R2D2'
      @personality = :repeater
      @move_set = 'rock'
    when 'Hal'
      @personality = :weighted
      @move_set = ['spock', 'spock', 'lizard', 'lizard',
                   'scissors', 'paper', 'rock']
    when 'Chappie'
      @personality = :surprise
      @move_set = ['scissors', 'scissors', 'scissors', 'paper']
    when 'Sonny'
      @personality = :weighted
      @move_set = ['scissors', 'scissors', 'paper', 'paper', 'paper', 'rock']
    when 'Number 5'
      @personality = :classic
    end
  end
end

class RPSGame
  def play
    display_welcome_message
    display_opponent
    loop do
      game_loop
      break unless play_again?
      reset_score
    end
    display_goodbye_message
  end

  def game_loop
    loop do
      human.choose
      computer.choose
      clear_screen
      display_moves
      display_winner
      update_score
      display_score
      break if check_score
    end
  end

  private

  WINNING_SCORE = 5
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "You will be playing first to #{WINNING_SCORE}"
  end

  def display_goodbye_message
    clear_screen
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock! Good-bye!"
  end

  def display_opponent
    puts "You are playing against #{computer.name}."
  end

  def display_moves
    puts "#{human.name} chose #{human.move.value}."
    puts "#{computer.name} chose #{computer.move.value}."
  end

  def display_total_moves
    display_human_moves
    puts
    display_computer_moves
  end

  def display_human_moves
    puts "You played:"
    human.total_moves.uniq.each do |move|
      puts "#{move.capitalize} #{human.total_moves.count(move)} times."
    end
  end

  def display_computer_moves
    puts "#{computer.name} played:"
    computer.total_moves.uniq.each do |move|
      puts "#{move.capitalize} #{computer.total_moves.count(move)} times."
    end
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "Current score: #{human.name} - #{human.score} | " \
    "#{computer.name} - #{computer.score}"
  end

  def update_score
    if human.move > computer.move
      human.score += 1
    elsif computer.move > human.move
      computer.score += 1
    end
  end

  def check_score
    if human.score == WINNING_SCORE
      puts "#{human.name} wins!"
      true
    elsif computer.score == WINNING_SCORE
      puts "#{computer.name} wins!"
      true
    end
  end

  def reset_score
    human.score = 0
    computer.score = 0
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n) or see the total moves? (t)"
      answer = gets.chomp.downcase
      if answer == 't' || answer == 'total'
        display_total_moves
        next
      end
      break if ['y', 'n', 'yes', 'no'].include?(answer)
      puts "Sorry, must be yes, no, or total"
    end

    return true if answer.start_with?('y')
    false
  end

  def clear_screen
    system('clear') || system('cls')
  end
end

RPSGame.new.play

class PointsController < ActionController::Base

  before_action :authenticate_dev!
  before_action :find_point, only: [:show, :edit, :update, :destroy]

  def index
    @points = Point.all
    connection.execute('SELECT * FROM points where ')
  end

  def show
    @questions = connection.execute('SELECT * FROM questions WHERE point_id = ?', params['id'])
  end

  def new
    @point = Point.new
  end

  def create
    @point = Point.new('user' => params['user'],
                      'github_url' => params['github_url'],
                      'point_total' => params['point_total'])
    if @point.save
      redirect_to points_path
    else
      render new
    end
  end

  def edit
  end

  def update
    @point.set_attributes('user' => params['user'], 'github_url' => params['github_url'], 'point_total' => params['point_total'])
    if @point.save
      redirect_to points_path
    else
      render edit
    end
  end

  def destroy
    point = Point.find(params['id'])
    point.destroy

    redirect_to points_path
  end


  def test_questions
    test = connection.execute('SELECT * FROM test', params['id'])
    render 'application/test_questions', locals: {test: test}
  end


  def list_tests
    tests = Test.all

    render 'application/list_tests', locals: {tests: tests}
  end

  def new_test
    test = Test.new

    render 'application/new_test', locals: {test: test}
  end

  def create_test
    test = Test.new('automate_or_die' => params['automate_or_die'],
                    'twenty_first_century_digital_boy' => params['twenty_first_century_digital_boy'],
                    'subtotal' => params['subtotal'])
    if test.save
      redirect_to '/list_tests'
    else
      render 'applications/new_test', locals: {test: test}
    end
  end


  private

  def connection
    db_connection = SQLite3::Database.new 'db/development.sqlite3'
    db_connection.results_as_hash = true
    db_connection
  end

  def new_record?
    id.nil?
  end

  def find_point
    @point = Point.find(params['id'])
  end




end

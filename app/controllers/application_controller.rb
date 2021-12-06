class ApplicationController < ActionController::Base

  # def list_points
  #   points = Point.all
  #
  #   render 'application/list_points', locals: { points: points}
  # end
  #
  # def show_point
  #   point = Point.find(params['id'])
  #   questions = connection.execute('SELECT * FROM questions WHERE point_id = ?', params['id'])
  #
  #   render 'application/show_point', locals: {point: point, questions: questions}
  # end
  #
  # def new_point
  #   point = Point.new
  #   render 'application/new_point', local: {point: point}
  # end
  #
  # def create_point
  #   point = Point.new('user' => params['user'],
  #                    'github_url' => params['github_url'],
  #                    'point_total' => params['point_total'])
  #   if point.save
  #     redirect_to '/list/points'
  #   else
  #     render 'applications/new_point', locals: {point: point}
  #   end
  # end
  #
  # def questions_testing_total
  #   if value === 1
  #     subtotal += 1
  #     subtotal
  #   end
  # end
  #
  #
  # def edit_point
  #   point = Point.find(params['id'])
  #
  #   render 'application/edit_point', locals: {point: point}
  # end
  #
  # def update_point
  #   point = Point.find(params['id'])
  #   point.set_attributes('user' => params['user'], 'github_url' => params['github_url'], 'point_total' => params['point_total'])
  #   point.save
  #   redirect_to '/list/points'
  # end
  #
  # def delete_point
  #   point = Point.find(params['id'])
  #   point.destroy
  #
  #   redirect_to '/list/points'
  # end
  #

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






end

class ApplicationController < ActionController::Base

  def list_points
    points = Point.all

    render 'application/list_points', locals: { points: points}
  end

  def show_point
    point = Point.find(params['id'])

    render 'application/show_point', locals: {point: point}
  end

  def new_point
    render 'application/new_point'
  end

  def create_point
    point = Point.new('user'=> params['user'],
                     'github_url' => params['github_url'],
                     'questions' => params['questions'],
                     'point_total' => params['point_total'])
    if post.save
      redirect_to '/list/points'
    else
      render 'applications/new_point', locals: {point: point}
    end

    point.save
    redirect_to '/list/points'
  end

  def questions_testing_total
    if value === 1
      subtotal += 1
      subtotal
    end
  end


  def edit_point
    point = Point.find(params['id'])

    render 'application/edit_point', locals: {point: point}
  end

  def update_point
    update_query = <<-SQL
UPDATE points
SET user      = ?,
    github_url = ?,
    point_total = ?
WHERE points.id = ?
    SQL
    connection.execute update_query, params['user'], params['github_url'], params['point_total'], params['id']

    redirect_to '/list/points'
  end

  def delete_point
    point = Point.find(params['id'])
    point.destroy

    redirect_to '/list/points'
  end




  private

  def find_point_by_id(id)
    connection.execute("SELECT * FROM points WHERE points.id = ? LIMIT 1", id).first
  end

  def connection
    db_connection = SQLite3::Database.new 'db/development.sqlite3'
    db_connection.results_as_hash = true
    db_connection
  end



end

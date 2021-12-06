class TestsController < ActionController::Base

  # before_action :find_test, only: [:show, :edit, :update, :destroy]

  def index
    @tests = Tests.all
    render 'tests/index'
  end

  def edit
    @test = Tests.find(params['id'])
  end


  def new
    @test = Tests.new

    render '/tests/new'
  end


  def show
    @test = Tests.find(params['id'])
  end

  def create
    @test = Tests.new('automate_or_die' => params['automate_or_die'],
                    'twenty_first_century_digital_boy' => params['twenty_first_century_digital_boy'])
    @test.set_subtotal
    if @test.save
      redirect_to '/tests'
    else
      render '/tests/new'
    end
  end

  def update
    @test = Tests.find(params['id'])
    @test.set_attributes('automate_or_die' => params['automate_or_die'], 'twenty_first_century_digital_boy' => params['twenty_first_century_digital_boy'])
    @test.set_subtotal
    if @test.save
      redirect_to '/tests'
    else
      render edit
    end
  end



  def destroy
    test = Tests.find(params['id'])
    test.destroy

    redirect_to tests_list_path
  end


  def find_test
    @test = Tests.find_test_table(params['id'])
  end


  private

  def connection
    db_connection = SQLite3::Database.new 'db/development.sqlite3'
    db_connection.results_as_hash = true
    db_connection
  end
end

require 'test_helper'
require 'rails/performance_test_help'

class ReportPerformanceTest < ActionDispatch::PerformanceTest
  def setup
  end

  def test_report
    get '/reports'
  end

end
#! /usr/bin/env ruby

require File.expand_path(File.dirname(__FILE__) + '/../config/environment')
require 'benchmark'

HOW_MANY_TIMES = 1000

Benchmark.bmbm do |x|
  user_name = ""

  x.report("if") do
    HOW_MANY_TIMES.times do
      nil if user_name.empty?
    end
  end

  x.report("exception") do
    HOW_MANY_TIMES.times do
      begin
        raise "boom!" if user_name.empty?
      rescue => e
      end
    end
  end

  x.report("catch/twrow") do
    HOW_MANY_TIMES.times do
      catch(:error) do
        throw :error if user_name.empty?
      end
    end
  end

end

Benchmark.bmbm do |x|
  user = User.new

  x.report("ActiveRecord#save") do
    HOW_MANY_TIMES.times do
      nil unless (user.save)
    end
  end

  x.report("ActiveRecord#save!") do
    HOW_MANY_TIMES.times do
      begin
        user.save!
      rescue => e
        nil
      end
    end
  end

end

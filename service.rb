require 'pry'

module ServiceBase
  class ServiceClassRuleError < StandardError
  end

  def self.included(base)
    base.extend(ClassMethods)
    unless base.name.include?('Service')
      raise ServiceClassRuleError.new(
              "#{base.name}: Please Rename Service Class",
            )
    end
  end

  module ClassMethods
    def perform(args)
      self.send(:new, **args).send(:perform)
    end
  end

  private

  def initialize
    raise NotImplementedError.new(
            "You must implement #{self.class}##{__method__}",
          )
  end

  def perform
    raise NotImplementedError.new(
            "You must implement #{self.class}##{__method__}",
          )
  end
end

class PostCreateService
  include ServiceBase

  private

  attr_reader :title, :content

  def initialize(title:, content:)
    @title = title
    @content = content
  end

  def perform
    # Post.new(title: title, content: content).tap { |p| p.save }
    puts '保存'
  end
end

a = PostCreateService.new(
  title: 'post_params[:title]',
  content: 'post_params[:content]',
)

PostCreateService.perform(
  title: 'post_params[:title]',
  content: 'post_params[:content]',
)

class Api::BaseController < ActionController::Base
  def record_response(record, status)
    hash = serialize_record(record)
    render_json(hash, status)
  end

  def serialize_record(record)
    "#{record.klass.name}Blueprint".constantize.render_as_hash(record)
  end

  def render_json(message, status)
    render json: message, status: status
  end
end

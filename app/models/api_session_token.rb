class ApiSessionToken
  TTL = 24.hours

  def self.store
    @store ||= Hash.new
  end

  def initialize(existing_token=nil)
    @token = existing_token
    self.last_seen = Time.now unless expired?
  end

  def token
    @token ||= SecureRandom.urlsafe_base64(nil, false)
  end

  def ttl
    return TTL unless last_seen
    elapsed   = Time.now - last_seen
    remaining = (TTL - elapsed).floor
    remaining > 0 ? remaining : 0
  end

  def last_seen
    store[:last_seen_at]
  end

  def last_seen=(as_at)
    store[:last_seen_at] = as_at
  end

  def user
    return if expired?
    store[:user]
  end

  def user=(user)
    store[:user] = user
  end

  def expired?
    ttl < 1
  end

  def valid?
    !expired? || !user.nil?
  end

  private

  def store
    self.class.store[token] ||= {}
  end
end
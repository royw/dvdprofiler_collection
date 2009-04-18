# An optional logger.
# If initialized with a logger instance, uses the logger
# otherwise doesn't do anything.
# Basically trying to not require a particular logger class.
class OptionalLogger
  # logger may be nil or a logger instance
  def initialize(logger)
    @logger = logger
  end

  # debug {...}
  def debug(msg=nil, &blk)
    unless @logger.nil?
      @logger.debug(msg) unless msg.nil?
      @logger.debug(blk.call) unless blk.nil?
    end
  end

  # info {...}
  def info(msg=nil, &blk)
    unless @logger.nil?
      @logger.info(msg) unless msg.nil?
      @logger.info(blk.call) unless blk.nil?
    end
  end

  # warn {...}
  def warn(msg=nil, &blk)
    unless @logger.nil?
      @logger.warn(msg) unless msg.nil?
      @logger.warn(blk.call) unless blk.nil?
    end
  end

  # error {...}
  def error(msg=nil, &blk)
    unless @logger.nil?
      @logger.error(msg) unless msg.nil?
      @logger.error(blk.call) unless blk.nil?
    end
  end
end


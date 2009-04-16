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
  def debug(&blk)
    @logger.debug(blk.call) unless @logger.nil?
  end

  # info {...}
  def info(&blk)
    @logger.info(blk.call) unless @logger.nil?
  end

  # warn {...}
  def warn(&blk)
    @logger.warn(blk.call) unless @logger.nil?
  end

  # error {...}
  def error(&blk)
    @logger.error(blk.call) unless @logger.nil?
  end
end


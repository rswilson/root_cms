class SiteSweeper < ActionController::Caching::Sweeper
  #observe MenuItem

  def after_save(record)
    self.class::sweep
  end
  
  def after_destroy(record)
    self.class::sweep
  end
  
  def self.sweep
    cache_dir = ActionController::Base.page_cache_directory
    Rails.logger.error "Sweeping!!!"
    unless cache_dir == "/public"
      FileUtils.rm_rf(Dir.glob(cache_dir+"/*")) rescue Errno::ENOENT
      Rails.logger.info("Cache directory '#{cache_dir}' fully swept.")
    end
  end
end

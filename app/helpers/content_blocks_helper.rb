module ContentBlocksHelper
  def valid_blocks
    options = SiteCustomization::ContentBlock::VALID_BLOCKS.map do |key|
      [t("activerecord.attributes.site_customization/content_block.VALID_BLOCKS.#{key}"), key]
    end
    Budget::Heading.allow_custom_content.each do |heading|
      options.push([heading.name, "hcb_#{heading.id}"])
    end
    options
  end
end

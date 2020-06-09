module Types
  module PageBlockInterface
    include Types::BaseInterface
    description 'PageBlock Interface'

    orphan_types(
      Types::ArticlesBlockType,
      Types::CardsBlockType,
      Types::EnhancedRichTextBlockType,
      Types::FAQBlockType,
      Types::GalleryBlockType,
      Types::LinksBlockType,
      Types::PartnersBlockType,
      Types::ReviewsBlockType,
      Types::RichTextBlockType,
      Types::SharedBlockType,
      Types::TabsBlockType,
      Types::VideoGalleryBlockType
    )

    field :id, ID, null: false
    field :blockAnchor, String, null: true
    field :bottomMargin, String, null: true
    field :bottomMarginXs, String, null: true
    field :cssClasses, [String], null: false
    field :position, Integer, null: true
    field :shared, Boolean, null: false
    field :topMargin, String, null: true
    field :topMarginXs, String, null: true

    field :type, String, null: false

    def css_classes
      object.css_class.split(' ')
    end

    def type
      object.class.name.demodulize
    end

    definition_methods do
      def resolve_type(object, context)
        case object
        when BlueberryCMS::PageBlocks::Articles
          Types::ArticlesBlockType
        when BlueberryCMS::PageBlocks::Cards
          Types::CardsBlockType
        when BlueberryCMS::PageBlocks::EnhancedRichText
          Types::EnhancedRichTextBlockType
        when BlueberryCMS::PageBlocks::FAQ
          Types::FAQBlockType
        when BlueberryCMS::PageBlocks::Gallery
          Types::GalleryBlockType
        when BlueberryCMS::PageBlocks::Links
          Types::LinksBlockType
        when BlueberryCMS::PageBlocks::Partners
          Types::PartnersBlockType
        when BlueberryCMS::PageBlocks::Reviews
          Types::ReviewsBlockType
        when BlueberryCMS::PageBlocks::RichText
          Types::RichTextBlockType
        when BlueberryCMS::PageBlocks::Shared
          Types::SharedBlockType
        when BlueberryCMS::PageBlocks::Tabs
          Types::TabsBlockType
        when BlueberryCMS::PageBlocks::VideoGallery
          Types::VideoGalleryBlockType
        else
          raise "Unexpected PageBlock: #{object.inspect}"
        end
      end
    end
  end
end

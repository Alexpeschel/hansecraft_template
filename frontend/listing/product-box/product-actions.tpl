{extends file="parent:frontend/listing/product-box/product-actions.tpl"}
{namespace name="frontend/listing/box_article"}

{* Product actions *}
{block name='frontend_listing_box_article_actions_content'}
    <div class="product--actions">

        {* Compare button *}
        {block name='frontend_listing_box_article_actions_compare'}
            {if {config name="compareShow"}}
                <form action="{url controller='compare' action='add_article' articleID=$sArticle.articleID}" method="post">
                    <button type="submit"
                       title="{s name='ListingBoxLinkCompare'}{/s}"
                       class="product--action action--compare"
                       data-product-compare-add="true">
                        <i class="icon--compare"></i> {s name='ListingBoxLinkCompare'}{/s}
                    </button>
                </form>
            {/if}
        {/block}

        {* Note button *}
        {block name='frontend_listing_box_article_actions_save'}
            <form action="{url controller='note' action='add' ordernumber=$sArticle.ordernumber}" method="post">
                <button type="submit"
                   title="{"{s name='DetailLinkNotepad' namespace='frontend/detail/actions'}{/s}"|escape}"
                   class="product--action action--note"
                   data-ajaxUrl="{url controller='note' action='ajaxAdd' ordernumber=$sArticle.ordernumber}"
                   data-text="{s name="DetailNotepadMarked"}{/s}">
                    <i class="icon--heart"></i> <span class="action--text">{s name="DetailLinkNotepadShort" namespace="frontend/detail/actions"}{/s}</span>
                </button>
            </form>
        {/block}

        {* Buy button *}
        {block name='frontend_listing_box_article_actions_buy'}
        <form name="sAddToBasket" method="post" action="{url controller='checkout' action='addArticle'}" class="buybox--form" data-add-article="true" data-eventname="submit" data-showmodal="false" data-addarticleurl="{url controller='checkout' action='ajaxAddArticleCart'}">
          <input type="hidden" name="sActionIdentifier" value="">
          <input type="hidden" name="sAddAccessories" value="">
          <input type="hidden" name="sAdd" value="{$sArticle.ordernumber}">
          <input type="hidden" name="sQuantity" value="1">
          <button class="product--action action--note" name="add2cart">
             <i class="icon--basket"></i> {s name='ButtonToBasket'}In den Warenkorb{/s}
          </button>
        </form>
        {/block}

        {* @deprecated: block no longer in use *}
        {block name='frontend_listing_box_article_actions_more'}{/block}

        {* @deprecated: misleading name *}
        {block name="frontend_listing_box_article_actions_inline"}{/block}
    </div>
{/block}

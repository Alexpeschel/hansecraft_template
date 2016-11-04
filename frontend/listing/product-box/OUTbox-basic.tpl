{extends file="parent:frontend/listing/product-box/box-basic.tpl"}
{namespace name="frontend/listing/box_article"}

{block name="frontend_listing_box_article"}
    <div class="product--box box--{$productBoxLayout}"
         data-page-index="{$pageIndex}"
         data-ordernumber="{$sArticle.ordernumber}"
         {if !{config name=disableArticleNavigation}} data-category-id="{$sCategoryCurrent}"{/if}>

        {block name="frontend_listing_box_article_content"}
            <div class="box--content" style="background-image: url({$sArticle.image.thumbnails[1].source})">

                {* Product box badges - highlight, newcomer, ESD product and discount *}
                {block name='frontend_listing_box_article_badges'}
                    {include file="frontend/listing/product-box/product-badges.tpl"}
                {/block}

                {block name='frontend_listing_box_article_info_container'}
                    <div class="product--info">
                      <!-- {$sArticle|@print_r} -->
                        {* Product image *}
                        {block name='frontend_listing_box_article_picture'}
                        {/block}

                        {* Customer rating for the product *}
                        {block name='frontend_listing_box_article_rating'}
                            <div class="product--rating-container">
                                {if $sArticle.sVoteAverage.average}
                                    {include file='frontend/_includes/rating.tpl' points=$sArticle.sVoteAverage.average type="aggregated" label=false microData=false}
                                {/if}
                            </div>
                        {/block}

                        {* Product name *}
                        {block name='frontend_listing_box_article_name'}
                            <a href="{$sArticle.linkDetails|rewrite:$sArticle.articleName}"
                               class="product--title"
                               title="{$sArticle.articleName|escapeHtml}">
                                {$sArticle.articleName|truncate:50|escapeHtml}
                            </a>
                        {/block}

                        {* Product description *}
                        {block name='frontend_listing_box_article_description'}
                            <div class="product--description">
                                {$sArticle.description_long|strip_tags|truncate:240}
                            </div>
                        {/block}

                        <!-- {* Product delivery *}
                        {block name="frontend_detail_data_delivery"}
                            {* Delivery informations *}
                            {if ($sArticle.sConfiguratorSettings.type != 1 && $sArticle.sConfiguratorSettings.type != 2) || $activeConfiguratorSelection == true}
                              {block name='frontend_widgets_listing_delivery_infos'}
                                <div class="product--delivery">
                                  {if isset($sArticle.active) && !$sArticle.active}
                                          <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
                                    <p class="delivery--information">
                                      <span class="delivery--text  delivery--text-not-available">
                                                  <i class="delivery--status-icon delivery--status-not-available"></i>
                                        {s name="DetailDataInfoNotAvailable"}{/s}
                                      </span>
                                    </p>
                                  {elseif $sArticle.sReleaseDate && $sArticle.sReleaseDate|date_format:"%Y%m%d" > $smarty.now|date_format:"%Y%m%d"}
                                          <link itemprop="availability" href="http://schema.org/PreOrder" />
                                    <p class="delivery--information">
                                      <span class="delivery--text delivery--text-more-is-coming">
                                                  <i class="delivery--status-icon delivery--status-more-is-coming"></i>
                                        {s name="DetailDataInfoShipping"}{/s} {$sArticle.sReleaseDate|date:'date_long'}
                                      </span>
                                    </p>
                                  {elseif $sArticle.esd}
                                          <link itemprop="availability" href="http://schema.org/InStock" />
                                    <p class="delivery--information">
                                      <span class="delivery--text delivery--text-available">
                                                  <i class="delivery--status-icon delivery--status-available"></i>
                                        {s name="DetailDataInfoInstantDownload"}Als Sofortdownload verfügbar{/s}
                                      </span>
                                    </p>
                                  {elseif {config name="instockinfo"} && $sArticle.modus == 0 && $sArticle.instock > 0 && $sArticle.quantity > $sArticle.instock}
                                    <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
                                    <p class="delivery--information">
                                      <span class="delivery--text delivery--text-more-is-coming">
                                                  <i class="delivery--status-icon delivery--status-more-is-coming"></i>
                                        {s name="DetailDataInfoPartialStock"}{/s}
                                      </span>
                                    </p>
                                  {elseif $sArticle.instock >= $sArticle.minpurchase}
                                          <link itemprop="availability" href="http://schema.org/InStock" />
                                    <p class="delivery--information">
                                      <span class="delivery--text delivery--text-available">
                                                  <i class="delivery--status-icon delivery--status-available"></i>
                                        {s name="DetailDataInfoInstock"}{/s}
                                      </span>
                                    </p>
                                  {elseif $sArticle.shippingtime}
                                          <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
                                    <p class="delivery--information">
                                      <span class="delivery--text delivery--text-more-is-coming">
                                                  <i class="delivery--status-icon delivery--status-more-is-coming"></i>
                                        {s name="DetailDataShippingtime"}{/s} {$sArticle.shippingtime} {s name="DetailDataShippingDays"}{/s}
                                      </span>
                                    </p>
                                  {else}
                                          <link itemprop="availability" href="http://schema.org/LimitedAvailability" />
                                    <p class="delivery--information">
                                      <span class="delivery--text delivery--text-not-available">
                                                  <i class="delivery--status-icon delivery--status-not-available"></i>
                                        {s name="DetailDataNotAvailable"}{config name=notavailable}{/s}
                                      </span>
                                    </p>
                                  {/if}
                                </div>
                              {/block}
                            {/if}
                        {/block} -->

                        {block name='frontend_listing_box_article_price_info'}
                            <div class="product--price-info">

                                {* Product price - Unit price *}
                                {block name='frontend_listing_box_article_unit'}
                                    {include file="frontend/listing/product-box/product-price-unit.tpl"}
                                {/block}

                                {* Product price - Default and discount price *}
                                {block name='frontend_listing_box_article_price'}
                                    {include file="frontend/listing/product-box/product-price.tpl"}
                                {/block}
                            </div>
                        {/block}

                        {* Product actions - Compare product, more information, buy now *}
                        {block name='frontend_listing_box_article_actions'}
                            {include file="frontend/listing/product-box/product-actions.tpl"}
                        {/block}
                    </div>
                {/block}
            </div>
        {/block}
    </div>
{/block}

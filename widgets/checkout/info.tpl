{extends file="parent:widgets/checkout/info.tpl"}
{* Notepad entry *}
{block name="frontend_index_checkout_actions_notepad"}
	<li class="navigation--entry entry--notepad" role="menuitem">
		<a href="{url controller='note'}" title="{"{s namespace='frontend/index/checkout_actions' name='IndexLinkNotepad'}{/s}"|escape}" class="btn">
			<i class="icon--heart-circle"></i>
			{if $sNotesQuantity > 0}
				<span class="badge notes--quantity">
					{$sNotesQuantity}
				</span>
			{/if}
		</a>
	</li>
{/block}

{* Cart entry *}
{block name="frontend_index_checkout_actions_cart"}
	<li class="navigation--entry entry--cart" role="menuitem">
		<a class="btn is--icon-left cart--link" href="{url controller='checkout' action='cart'}" title="{"{s namespace='frontend/index/checkout_actions' name='IndexLinkCart'}{/s}"|escape}">
			<i class="icon--basket-circle"></i>

      <span class="badge is--primary is--minimal cart--quantity{if $sBasketQuantity < 1} is--hidden{/if}">{$sBasketQuantity}</span>

			<span class="cart--amount">
				{$sBasketAmount|currency} {s name="Star" namespace="frontend/listing/box_article"}{/s}
			</span>
		</a>
		<div class="ajax-loader">&nbsp;</div>
	</li>
{/block}

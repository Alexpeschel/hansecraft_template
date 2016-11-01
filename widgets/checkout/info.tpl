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

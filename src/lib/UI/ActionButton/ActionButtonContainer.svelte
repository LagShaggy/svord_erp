<script lang="ts">
	import ExpandProvider from '../Dropdown/ExpandProvider.svelte'
	import ExpandButton from '../Dropdown/ExpandButton.svelte'
	import ExpandContent from '../Dropdown/ExpandContent.svelte'

	import { actionStore } from './actionButtonStore'
</script>

<ExpandProvider let:expandControll>
	<ExpandButton
		expandControll={expandControll.toggle}
		className="fixed bottom-20 right-10 bg-base-colour aspect-square h-12 rounded-full"
	>
		<svg
			xmlns="http://www.w3.org/2000/svg"
			width="26"
			height="26"
			viewBox="0 0 24 24"
			stroke="currentColor"
			stroke-width="2"
			stroke-linecap="round"
			stroke-linejoin="round"
			class="fill-white stroke-white feather feather-plus"
		>
			<line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg
		>
	</ExpandButton>
	<ExpandContent expanded={expandControll} displaceCSS="">
		{#each $actionStore as Action}
			<svelte:component this={Action} />
		{/each}
	</ExpandContent>
</ExpandProvider>

<script lang="ts">
	import ExpandProvider from '../Dropdown/ExpandProvider.svelte'
	import ExpandButton from '../Dropdown/ExpandButton.svelte'
	import ExpandContent from '../Dropdown/ExpandContent.svelte'

	import { actionStore } from './actionButton'
	import ActionButton from './ActionButton.svelte'
</script>

<div class="fixed bottom-20 right-10">
	<ExpandProvider let:expandControll>
		{#if $actionStore.length > 1}
			<ExpandContent
				expanded={expandControll}
				displaceCSS="bottom-12 mb-1"
				className="flex flex-col gap-1"
			>
				{#each $actionStore as props}
					<svelte:component this={ActionButton} action={{ ...props }} />
				{/each}
			</ExpandContent>
			<ExpandButton
				expandControll={expandControll.toggle}
				className=" bg-primary-colour aspect-square h-12 rounded-full"
			>
				<svg
					xmlns="http://www.w3.org/2000/svg"
					width="28"
					height="28"
					viewBox="0 0 24 24"
					fill="none"
					stroke="currentColor"
					stroke-width="2"
					stroke-linecap="round"
					stroke-linejoin="round"
					class="fill-white stroke-white feather feather-more-vertical"
				>
					<circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle
						cx="12"
						cy="19"
						r="1"
					></circle>
				</svg>
			</ExpandButton>
		{:else}
			<svelte:component this={ActionButton} action={{ ...$actionStore[0] }} />
		{/if}
	</ExpandProvider>
</div>

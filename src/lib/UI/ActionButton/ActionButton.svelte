<script lang="ts">
	import type { ActionType } from './types'

	export let action: ActionType
</script>

<div class="relative bg-transparent">
	{#if action.name}
		<div
			class="absolute h-12 right-8 top-0 -z-10 min-w-max px-5 rounded-l-3xl align-middle bg-primary-colour bg-opacity-40 text-white flex items-center"
		>
			{action.name}
		</div>
	{/if}
	<button
		on:click={action.command}
		class="flex justify-center items-center bg-primary-colour aspect-square h-12 rounded-full {action.className}"
	>
		<svelte:component this={action.img} />
	</button>
</div>

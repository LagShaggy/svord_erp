<script lang="ts">
	import { blur, slide } from 'svelte/transition'
	import type { ActionType } from './types'
	import { onMount } from 'svelte'

	export let action: ActionType

	let showName: boolean = false

	onMount(() => setTimeout(() => (showName = true), 100))
</script>

<div class="relative bg-transparent">
	{#if action.name}
		{#if showName && action.name}
			<div
				in:slide={{ delay: 300, duration: 400, axis: 'x' }}
				out:blur={{ duration: 100, amount: '5px' }}
				class="absolute h-12 right-7 top-0 -z-10 min-w-max px-6 rounded-l-3xl align-middle bg-primary-colour bg-opacity-40 text-white flex items-center backdrop-blur"
			>
				{action.name}
			</div>
		{/if}
	{/if}
	<button
		on:click={action.command}
		class="flex justify-center items-center bg-primary-colour aspect-square h-12 rounded-full {action.className}"
	>
		<svelte:component this={action.img} />
	</button>
</div>

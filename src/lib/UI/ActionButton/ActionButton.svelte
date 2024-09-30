<script lang="ts">
	import { blur, slide } from 'svelte/transition'
	import type { ActionType } from './types'
	import { createEventDispatcher, onMount } from 'svelte'
	import RoundButton from '../Primitive/RoundButton.svelte'

	export let action: ActionType

	let showName: boolean = false
	onMount(() => setTimeout(() => (showName = true), 100))

	const closeEvent = createEventDispatcher()
</script>

<div class="relative bg-transparent">
	{#if action.name}
		{#if showName && action.name}
			<div
				in:slide={{ delay: 300, duration: 400, axis: 'x' }}
				out:blur={{ duration: 100, amount: '5px' }}
				class="absolute h-12 right-7 top-0 -z-10 min-w-max px-6 rounded-l-3xl align-middle bg-primary-300 bg-opacity-50 text-black flex items-center backdrop-blur"
			>
				{action.name}
			</div>
		{/if}
	{/if}
	<RoundButton
		command={() => {
			action.command()
			closeEvent('close')
		}}
	>
		<slot>
			<svelte:component this={action.img} />
		</slot>
	</RoundButton>
</div>

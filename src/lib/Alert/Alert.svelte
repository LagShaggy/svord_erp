<script lang="ts">
	import { onMount } from 'svelte'
	import type { Alert } from './alert'

	export let alert: Alert

	let backgroundColour: string
	let borderColour: string

	switch (alert.type) {
		case 'INFO':
			backgroundColour = 'bg-blue-200'
			borderColour = 'border-blue-300'
			break
		case 'OK':
			backgroundColour = 'bg-green-200'
			borderColour = 'border-green-300'
			break
		case 'WARNING':
			backgroundColour = 'bg-yellow-200'
			borderColour = 'border-yellow-300'
			break
		case 'ERROR':
			backgroundColour = 'bg-red-200'
			borderColour = 'border-red-300'
			break
	}

	const destroyThis = () => {
		console.log('we forgot to implement the destroy method')
	}
</script>

<button on:click={destroyThis}>
	<div class="px-5 py-2 border rounded-md bg-opacity-90 {backgroundColour} {borderColour}">
		<h3>{alert.title}</h3>
		<p>{alert.message}</p>
	</div>
</button>

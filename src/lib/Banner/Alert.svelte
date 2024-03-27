<script>
	import { alert } from '$lib/stores'
	import { onDestroy, onMount } from 'svelte'

	let alertInfo = $alert

	const unsubscribe = alert.subscribe((/** @type {{}} */ value) => (alertInfo = value))

	onMount(() => {})

	onDestroy(() => {
		unsubscribe()
	})

	function destroy() {
		alertInfo.set(null)
		console.log('Alter says Goodbye')
	}
	console.log('Hi from the Alert : ' + alert)
</script>

{#if alertInfo}
	<div
		class="absolute top-6 left-1/2 z-20 -translate-x-1/2 -translate-y-1/2
		transform rounded-md border bg-{alertInfo.colour}-300 mt-3 p-2 px-5 py-1
		text-center sm:mx-2"
		on:click={destroy}
		on:keydown={destroy}
	>
		<h3>{alertInfo.title}</h3>
		<p>
			{alertInfo.text}
		</p>
	</div>
{/if}

<script lang="ts">
	import type { Alert } from './alert'

	export let alert: Alert
	export let destroy: () => void

	let style: string

	switch (alert.type) {
		case 'INFO':
			style = 'bg-blue-500'
			break
		case 'OK':
			style = 'bg-green-500'
			break
		case 'WARNING':
			style = 'bg-yellow-500'
			break
		case 'ERROR':
			style = 'bg-red-500'
			break
	}
</script>

<button class="mx-2" on:click={destroy}>
	<div class="px-5 py-2 text-white border rounded-md bg-opacity-90 {style}">
		<h3>{alert.title}</h3>
		<p>{alert.message}</p>
	</div>
</button>

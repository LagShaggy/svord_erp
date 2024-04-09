<script lang="ts">
	import { createEventDispatcher } from 'svelte'

	const dispatcher = createEventDispatcher()

	const clicked = () => {
		dispatcher('activated')
	}
	export let path: string
</script>

<a href={path} on:click={clicked} class="flex justify-left items-center">
	<div class="">
		<slot />
	</div>
</a>

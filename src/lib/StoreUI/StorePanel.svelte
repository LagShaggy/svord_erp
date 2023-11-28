<script lang="ts">
	import StoreItem from '$lib/StoreUI/StoreItem.svelte'

	//gets imported when instantiated
	export let products = []

	//misc
	let todo = {
		done: false
	}
</script>

<div class="flex w-screen">
	<!-- The Grid-->
	<div class="grid gap-4 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">
		{#each products as item}
			<StoreItem {item} />
		{/each}
	</div>
	<!--Controll-->
</div>

<div class:done={todo.done} />

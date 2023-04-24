<script>
	import StoreItem from '$lib/StoreUI/StoreItem.svelte'
	import StoreControll from './StoreControll.svelte'

	//gets imported when instantiated
	export let products = {}

	// user preference module
	let col = 3

	//misc
	let todo = {
		done: false
	}
</script>

<!-- The userinterface of the Store-->
<!--
<div>
	<div class="container flex justify-end bg-blue-500">
		<label>
			{col} Items
			<input
				class="ml-4"
				type="range"
				bind:value={col}
				min="1"
				max="20"
			/>
		</label>
	</div>
</div>
-->

<div class="flex w-screen">
	<!-- The Grid-->
	<div
		class="grid gap-4 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4"
	>
		{#each products as item}
			<StoreItem class="mx-3" {item} />
		{/each}
	</div>
	<!--Controll-->
	<div class="w-1/2">
		<StoreControll>
			Here The Controlls will be
		</StoreControll>
	</div>
</div>

<div class:done={todo.done} />

<script>
	import StoreItem from '$lib/StoreUI/StoreItem.svelte';
	import Layout from '../../routes/+layout.svelte';

	//gets imported when instantiated
	export let products = {};

	// user preference module
	let col = 3;

	//misc
	let todo = {
		done: false
	};

	$: console.log(col);
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

<!-- The Grid-->
<div class="grid gap-5 md:grid-cols-3">
	{#each products as item}
		<StoreItem {item} />
	{/each}
</div>

<div class:done={todo.done} />

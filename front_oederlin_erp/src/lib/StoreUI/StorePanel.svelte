<script>
	import StoreItem from '$lib/StoreUI/StoreItem.svelte';
	export let item = {
		name: 'Suit',
		quantity: 3
	};

	// user preference module
	let col = 3;
	let todo = {
		done: false
	};

	$: console.log(col);
</script>

<!-- The userinterface of the Store-->
<div>
	<div class="container flex justify-end bg-blue-500">
		<label>{col} Columns</label>
		<input
			class="ml-4"
			type="range"
			bind:value={col}
			min="1"
			max="20"
		/>
	</div>
</div>

<div class="grid gap-4 md:grid-cols-3">
	{#each Array(20) as _}
		<StoreItem {item} />
	{/each}
</div>

<div class:done={todo.done} />

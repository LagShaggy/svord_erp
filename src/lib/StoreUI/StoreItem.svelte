<script lang="ts">
	//gets imported when instantiated
	export let item: any

	//design

	//on:click
	function click() {
		//something
	}

	//availability Button
	let color = 'red'
	if (item.quantity > 5) {
		color = 'green'
	} else if (item.quantity > 0) {
		color = 'yellow'
	}
</script>

<a
	class="aspect-square rounded-md border-y-2 border-slate-400 p-2 hover:bg-slate-400 hover:opacity-80"
	on:click={click}
	on:keypress
	href="products/item/{item.id}"
>
	<div class="mb-2 flex items-center justify-between gap-2">
		<h2>
			{item.name}
		</h2>

		<div>
			<div>
				<p class="mr-1 text-right font-light">
					ID: {item.id}
				</p>
			</div>
		</div>
	</div>
	<p class="text-left">
		Lorem ipsum dolor sit amet consectetur adipisicing elit. Obcaecati, ex expedita. Commodi minima
		dolorem at, pariatur reiciendis quibusdam laborum ducimus nihil voluptatum laboriosam
		accusantium, aliquid amet incidunt suscipit minus. Nam?
	</p>
</a>

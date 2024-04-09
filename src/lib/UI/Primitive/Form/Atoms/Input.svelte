<script lang="ts">
	import type { HTMLInputTypeAttribute } from 'svelte/elements'

	export let type: HTMLInputTypeAttribute
	export let name: string
	export let value: string = ''
	export let placeholder: string = ''
</script>

<label class="flex justify-between text-left">
	<slot>
		<p>
			{name}
		</p>
	</slot>
	<input
		{name}
		{type}
		{value}
		{placeholder}
		{...$$slots}
		class="clickable text-left px-3 ml-5 w-80 bg-comp-colour bg-opacity-20"
	/>
</label>

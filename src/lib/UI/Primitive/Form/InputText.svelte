<script lang="ts">
	import type { HTMLInputTypeAttribute } from 'svelte/elements'

	export let type: HTMLInputTypeAttribute
	export let name: string = ''
	export let value: string = ''
</script>

<label class="flex justify-between text-left">
	<slot>
		<p>
			{type}
		</p>
	</slot>
	<input
		{type}
		{name}
		{value}
		placeholder={type}
		class="border border-comp-colour rounded-full text-left px-3 ml-5 w-80"
	/>
</label>

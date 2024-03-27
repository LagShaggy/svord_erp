<script lang="ts">
	import type { HTMLInputTypeAttribute } from 'svelte/elements'

	export let type: string = ''
	export let name: string = ''
</script>

<label class="flex justify-between text-left">
	<slot>
		<p>
			{type}
		</p>
	</slot>
	<input
		{name}
		type="password"
		placeholder="Password"
		class="border border-comp-colour rounded-full text-left px-3 ml-5 w-80"
	/>
</label>

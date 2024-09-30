<script lang="ts">
	import { goto } from '$app/navigation'
	import type { TabProps } from './types'

	export let props: TabProps
</script>

<button
	class="flex-grow p-1 bg-primary-50 shadow-lg rounded-t-md"
	on:click={() => goto(props.redirect)}
>
	<div class="flex flex-col items-center">
		<img class="h-6 w-6" src={props.img} alt="prop" />
		<p>
			{props.name}
		</p>
	</div>
</button>

<script lang="ts">
	export let command = () => {}
	export let submit = false
	export let formaction: string | null = null
	export let className: string = ''
</script>

<button
	on:click={command}
	type={submit ? 'submit' : null}
	class="transition-all relative
	focus:border-secondary-700 focus:border
	{className}"
	{formaction}
>
	<!-- <div class="rounded-full outline-none">
		<div
			class="absolute w-1/2 h-max left-0 bg-gradient-to-l from-white to-secondary-700 from-70% rounded-l-full"
		>
			&nbsp
		</div>

		<div
			class="absolute w-1/2 h-max right-0 bg-gradient-to-r from-white to-secondary-700 from-70% rounded-r-full"
		>
			&nbsp
		</div>
	</div> -->
	<slot />
</button>

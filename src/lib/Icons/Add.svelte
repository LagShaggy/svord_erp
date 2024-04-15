<script lang="ts">
	export let x: number = 28
	export let y: number = x
	export let className: string = ''
</script>

<svg
	xmlns="http://www.w3.org/2000/svg"
	width={x}
	height={y}
	viewBox="0 0 24 24"
	stroke-width="2"
	stroke-linecap="round"
	stroke-linejoin="round"
	class="fill-white stroke-white feather feather-plus {className}"
>
	<line x1="12" y1="5" x2="12" y2="19"></line>
	<line x1="5" y1="12" x2="19" y2="12"></line>
</svg>

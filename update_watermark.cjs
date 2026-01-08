const fs = require('fs');
const path = require('path');

const svgContent = `<svg width="260" height="260" viewBox="0 0 260 260" opacity="0.2" xmlns="http://www.w3.org/2000/svg">
  <text x="50%" y="50%" dominant-baseline="middle" text-anchor="middle" font-family="Segoe UI, sans-serif" font-weight="900" font-size="32" fill="currentColor">
    SOM DVPS
  </text>
</svg>`;

const files = [
	'src/vs/workbench/browser/parts/editor/media/letterpress-light.svg',
	'src/vs/workbench/browser/parts/editor/media/letterpress-hcLight.svg',
	'src/vs/workbench/browser/parts/editor/media/letterpress-hcDark.svg',
	'src/vs/workbench/browser/parts/editor/media/letterpress-dark.svg'
];

files.forEach(file => {
	const fullPath = path.resolve(__dirname, file);
	fs.writeFileSync(fullPath, svgContent, 'utf8');
	console.log(`Updated: ${fullPath}`);
});

console.log("Watermarks updated to 'SOM DVPS' text.");

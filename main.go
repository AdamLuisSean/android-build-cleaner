package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"path/filepath"
)

func main() {
	file, err := os.Open("read.txt")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)

	sum := 0

	for scanner.Scan() { // internally, it advances token based on sperator
		path := scanner.Text()
		size, err := DirSize(path)
		if err != nil {
			fmt.Println(err)
		}
		sum += int(size)
		//increment size
		fmt.Println(path, size) // token in unicode-char
		//fmt.Println(scanner.Bytes()) // token in bytes

	}

	fmt.Println("Total: ", ((sum/1024)/1024)/1024, " GBytes")

}

// DirSize ...
func DirSize(path string) (int64, error) {
	var size int64
	err := filepath.Walk(path, func(_ string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if !info.IsDir() {
			size += info.Size()
		}
		return err
	})
	return size, err
}
